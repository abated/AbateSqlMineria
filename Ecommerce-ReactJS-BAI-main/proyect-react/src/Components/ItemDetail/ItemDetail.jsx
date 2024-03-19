import { CartContext } from "../CartContext/CartContext";
import ItemCount from "../ItemCount/ItemCount";

import { useContext, useEffect,useState } from "react";
import addToCart from '../CartContext/CartContext'
// const dario = ()=>{
//     addToCart(product)
//   }


const ItemDetail = ({ ProductoSeleccionado }) => {

    useEffect(() => {
        }, []);

        // const clickAgregarProducto = () => {
        //     addToCart(ProductoSeleccionado)
        //   }

    if (!ProductoSeleccionado) {
        return <div>Cargando...</div>;
    }
    return (
        <main className="item-detail">
            <h1 style={{ textTransform: "capitalize" }}>{ProductoSeleccionado.name}</h1>
            <section style={{ display: "flex" }}>
            <img src={ProductoSeleccionado.imagen}alt="" />

                <section className="producto-info">
                    <p>Description: {ProductoSeleccionado.description}</p>
                    <p>Stock: {ProductoSeleccionado.stock}</p>
                    <p>Price: {ProductoSeleccionado.price}</p>
                    <p>Category: {ProductoSeleccionado.categoria}</p> 
                </section>
            </section>
            <ItemCount stock={10} initial={1} item={ProductoSeleccionado}  />
            
        </main>
    );
};

export default ItemDetail;
