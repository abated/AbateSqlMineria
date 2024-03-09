import { useState, useContext } from "react";
import CartContext from "../CartContext/CartContext";
import NoItemsLoad from "../ItemLoad/ItemLoad";
import SendOrder from "../SendOrder/SendOrder";



const Cart = () => {
  const { cart, setCart, removeAll, total} = useContext(CartContext); 
 
  return !cart.length ? (
    <NoItemsLoad />
) : (
    <div className="tarjetas">
      {cart.map((item) => {
        return (
          <div key={item.id}>
            <Card maxW="sm">
              <CardHeader>
                <Heading size="md">{item.name}</Heading>
                <img src={item.img} alt="" />
              </CardHeader>
              <CardBody>
                <Text as="b">Cantidad: {item.quantity}</Text>
                <Text>Precio: $ {item.price}</Text>
                <Text>Total: $ {item.price * item.quantity}</Text>
              </CardBody>
              <CardFooter>
              <div className="bloqButtonClear">
                <button className="btn btn-danger btnClear" onClick={removeAll}>
                    Vaciar carrito
                </button>
                </div>
              </CardFooter>
            </Card>
          </div>
        );
      }
      )}
        <div className="total">
          <h4>TOTAL $ {total()}</h4>
          <SendOrder/>
        </div>
    </div>
  );
};

export default Cart;
