import { useContext } from "react";
import NoItemsLoad from "../ItemLoad/ItemLoad";
import { CartContext } from "../CartContext/CartContext";

const Cart = () => {
  const { cart, total} = useContext(CartContext); 

 console.log(cart)
  return !cart.length ? (
    <NoItemsLoad />
) : (
    <div className="tarjetas">
      {cart.map((item) => {
        return (
         <div key={item.id}>
          <h1>
            producto es : {item.name}
            cantidad es : {item.cantidad}
            precio es : {item.cantidad * item.price}
          

          </h1>
         </div>
        
        );
      }
      )}
        <div className="total">
          <h4>TOTAL $ {total()}</h4>
          
        </div>
    </div>
  );
};

export default Cart;
