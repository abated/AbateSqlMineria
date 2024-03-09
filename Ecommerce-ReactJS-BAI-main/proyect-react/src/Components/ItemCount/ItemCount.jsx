import { useState, useContext,useEffect } from "react"
import CartContext from "../CartContext/CartContext";


    const ItemCount = ({ stock =0, initial = 1, item}) =>{
    const [count, setCount] = useState (initial)
    const [stockReal, setStockReal] = useState(stock); 
    const{cart, setCart} = useContext(CartContext);

    const increment = () =>{
        if(count < stock){
            setCount(prev => prev + 1)
        }
    }

    const decrement = () =>{
        if(count >1 ){
            setCount(prev => prev -1)
        }
    }
  
    const descontarStock = (quantity) => {
      setStockReal(stockReal - quantity)
    }
    useEffect(() => {
    }, [cart]);
    
    const addToCart = (item) => {
        console.log("hola")
            const isItemFound =  cart.find((items) => items.id === item.id); 
            if (isItemFound) {
              return cart.map((i) => {
                if (i.id === item.id) {
                  setCart([...cart,{...item,quantity: item.quantity +1}])
                } 
              });
            } else {
              setCart([...cart, { item }])
            }
         
        }; 

  return (
    <div>

        <div className="item-count">
            <button onClick={decrement}>-</button>
            <p>{count}</p>
            <button onClick={increment}>+</button>
            <button onClick={addToCart(item)} >Agregar al Carrito</button>
        </div>
        
    </div>
  )
}

export default ItemCount 


