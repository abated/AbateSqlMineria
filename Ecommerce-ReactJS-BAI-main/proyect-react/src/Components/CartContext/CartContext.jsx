import { createContext, useState,useEffect } from "react";


export const CartContext = createContext(null);

export const ShoppingCartProvider = ({ children }) => {

    
    const [cart, setCart] = useState([]);
    
    useEffect(() => {
    },[setCart]);


    const total = () => {
        let total = 0;
        cart.forEach(prod => {
          total = total + prod.price * prod.quantity
        })
        return total;
      }

    const removeAll = () => {
        setCart([]);
    }

    // const addToCart = (item) => {
    //   console.log("hola")
    //       const isItemFound =  cart.find((items) => items.id === item.id); 
    //       if (isItemFound) {
    //         return cart.map((i) => {
    //           if (i.id === item.id) {
    //             setCart([...cart,{...item,quantity: item.quantity +1}])
    //           } 
    //         });
    //       } else {
    //         setCart([...cart, { item }])
    //       }
       
    //   }; 

    return (
        <CartContext.Provider value={{cart,setCart,removeAll,total}}>
            {children}
        </CartContext.Provider>
    );
};

export default CartContext;