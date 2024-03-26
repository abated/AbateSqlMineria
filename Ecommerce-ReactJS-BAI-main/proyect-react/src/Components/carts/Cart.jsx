import { useContext, useState, useRef } from "react"
import NoItemsLoad from "../ItemLoad/ItemLoad";
import { CartContext } from "../CartContext/CartContext";
import { collection,addDoc,getFirestore } from "firebase/firestore";


const Cart = () => {
  const db = getFirestore()
  const { cart, total} = useContext(CartContext); 
  const [usuarios, setUsuarios] = useState([])
  const [nombre, setNombre] = useState("")
  const [telefono, setTelefono] = useState("")
  const [email, setEmail] = useState("")
  const nameInput = useRef(null);
  const telInput = useRef(null);
  const emailInput = useRef(null);
  const handleClick = () => {
    if (nombre === '') {
      nameInput.current.focus()
      return false
    }
    if (telefono === '') {
      telInput.current.focus()
      return false
    } if (email === '') {
      emailInput.current.focus()
      return false
    }

    setUsuarios([...usuarios, {
      id: Math.random(),
      nombre: nombre,
      telefono: telefono,
      email: email
    }]
    )
  }

  const handleChange = (e) => {
    setNombre(e.target.value)
  }
  const handleChange2 = (e) => {
    setTelefono(e.target.value)
  }
  const handleChange3 = (e) => {
    setEmail(e.target.value)
  }

  const [idCompra, setIdCompra] = useState("")
  const guardarCompra = () => {
    const ordenesCollection = collection(db, "ordenes")
    const orden = {
      buyer: {
        Nombre: nombre,
        Telefono: telefono,
        Email: email,
        items:cart,
        
      }
      
    }
    const consulta = addDoc(ordenesCollection, orden)
    consulta
      .then((resultado) => {
        setIdCompra(resultado.id)
      })
      .catch((error) => {
        console.log(error)
      })
  }
    


  return !cart.length ? (
    <NoItemsLoad />
) : (
    <div className="tarjetas">
      {cart.map((item) => {
        return (
         <div key={item.id}>
         
            producto es : {item.name}
            cantidad es : {item.cantidad}
            precio es : {item.cantidad * item.price}

              
         </div>
         
        );   
  }
  
      )
      }
                  <form >
              <h1>nombre</h1>
              <input type="text" placeholder="Nombre" ref={nameInput} onChange={handleChange} />
              <h1>Telefono</h1>
              <input type="number" placeholder="Telefono de contacto" ref={telInput} onChange={handleChange2} />
              <h1>Email</h1>
              <input type="email" placeholder="Correo Electronico" ref={emailInput} onChange={handleChange3} />
            </form>
             <button onClick={handleClick}> Confirmar Datos del Comprador</button>
      
        <div className="total">
          <h4>TOTAL $ {total()}</h4>
          {usuarios.length && cart.length > 0 ? <div className="finalizarCompra">
          <button className="finalizarCompra" onClick={guardarCompra}>Finalizar Compra </button></div> : <div></div>}
        {idCompra ? <h3>compra guardada con el id {idCompra}</h3> : ""}
          
        </div>
    </div>
  );
};

export default Cart;
