import React, { useContext } from 'react'
import {collection, getFirestore, addDoc} from "firebase/firestore"
import { useState } from 'react'
import CartContext from '../CartContext/CartContext';


/* El componente SendOrder visualiza el formulario, y esta conectada a FireBase, enviando la informacion del cliente del pedido realizado y creando una OrdenId */

const SendOrder = () => {
  const {removeAll} = useContext(CartContext);
  const [orderId, setOrderId] = useState (null);
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [lastname, setLastname] = useState("");
 
  const db = getFirestore()
  const handleSubmit = (e) => {
    e.preventDefault()
    addDoc(ordersCollection, order).then(({id}) => setOrderId(id));
  };

const order ={
  name,
  email,
  lastname
}

const ordersCollection = collection(db, "orden")

return (
  <div>
    <form className='formulario' onSubmit={handleSubmit}>
      <input className='controles' type="text" onChange={(e) => setName(e.target.value)} placeholder="Nombre" required/>
      <input className='controles' type="text" onChange={(e) => setLastname(e.target.value)} placeholder="Apellido" required/>
      <input className='controles' type="email" onChange={(e) => setEmail(e.target.value)} placeholder="Email" required/>
      <button className='controles' type='submit'>Enviar Orden de Compra</button>
      <button className='controles' type='submit' onClick={removeAll}>Finalizar Compra</button>
      <h2 bg="red">ID de la orden {orderId}</h2>
    </form>
  </div>
  )
}

export default SendOrder