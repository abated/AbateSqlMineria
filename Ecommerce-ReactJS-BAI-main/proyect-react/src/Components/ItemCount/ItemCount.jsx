import { useState, useContext, useEffect } from "react";
import { CartContext } from "../CartContext/CartContext";

const ItemCount = ({ stock = 0, initial = 1, item }) => {
  const [count, setCount] = useState(initial);
const [stockReal,setStockReal] = useState(stock)
const {addToCart} = useContext(CartContext)

const ClickCount = () =>{
  addToCart(item,count)
  console.log(item)
}

  const increment = () => {
    if (count < stock && stockReal > 0) {
      setCount((prev) => prev + 1);
      
      descontarStock(1);
    }
  };

  const decrement = () => {
    if (count > 1) {
      setCount((prev) => prev - 1);
      descontarStock(-1);
    }
  };

  const descontarStock = (quantity) => {
    setStockReal(stockReal - quantity);
  };

  useEffect(() => {
    if (stockReal !== stock) {
      setCount((prevCount) => Math.min(prevCount, stock));
      setStockReal(stock);
    }
  }, [stock, stockReal]);

  return (
    <div>
      <div className="item-count">
        <button onClick={decrement}>-</button>
        <p>{count}</p>
        <button onClick={increment}>+</button>
        <button onClick={ClickCount}>Agregar al Carrito</button>
      </div>
    </div>
  );
};

export default ItemCount;
