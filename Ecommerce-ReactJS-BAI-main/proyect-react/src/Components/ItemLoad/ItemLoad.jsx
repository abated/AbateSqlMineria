import React from 'react'
import { Link } from "react-router-dom";


const NoItemsLoad = () => {
return (
    <div>
        <h1 className='strong'>¡Ops!</h1>
        <p className='strong'>¡El carrito se encuentra vacio!</p>
        <p className='strong'>Vuelve al menu para poder ver nuestros productos</p>
        <Link to={"../"}>
        <button className="tienda">Ir a la  Tienda </button>
        </Link>
    </div>
)
}

export default NoItemsLoad