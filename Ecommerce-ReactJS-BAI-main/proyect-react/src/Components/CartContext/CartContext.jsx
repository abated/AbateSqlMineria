import { createContext,useState,useEffect, useContext } from "react";


export const CartContext = createContext();
const { Provider } = CartContext;
export const ShoppingCartProvider = ({ children }) => {
  const [cart, setCart] = useState([])
  const [cantidad_total, setCantidad_total] = useState(0)
  const [precio_total, setPrecio_total] = useState(0)
    const estaEnCarrito = (id) => {
      return cart.find(elemento => elemento.id === id)
  } 

    const addToCart = (producto,cantidad) => {
        if (estaEnCarrito(producto.id)) {
        
            const nuevoCarrito = [...cart]
            for (const elemento of nuevoCarrito) {
                if (elemento.id === producto.id) {
                    elemento.cantidad = producto.cantidad+cantidad
                }
            }
            setCart(nuevoCarrito)
        } else {
            producto.cantidad = cantidad
            setCart([...cart, producto])
        }
        
        setCantidad_total(cantidad_total + producto.cantidad)
        setPrecio_total(precio_total + (producto.cantidad * producto.price))
    }
  
    const total = () => {let total = 0;
         cart.forEach(prod => {total = total + (prod.price * prod.cantidad)})  
                return total; }


    
    const valorDelContexto = {
      addToCart,
      total,
      cart
 
    }
    return (
        <Provider value={valorDelContexto}>
            {children}
        </Provider>
    )

}



export default ShoppingCartProvider;