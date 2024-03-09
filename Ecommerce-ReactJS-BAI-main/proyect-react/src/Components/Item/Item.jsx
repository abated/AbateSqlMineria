import { Link } from "react-router-dom";

 export default function Item ({product}){
    return(
        <div>
            <img src={product.imagen}alt="" />
            <h2>{product.name}</h2>
            <p>{product.description}</p>
            <h1>{product.price}</h1>
            <p>{product.stock}</p>    
          <Link to={`/product/${product.id}`}>
            <button>Ver Detalles</button>
          </Link>
        </div>
    )
 }
