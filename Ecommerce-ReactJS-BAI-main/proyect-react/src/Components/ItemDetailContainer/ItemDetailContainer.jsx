// import { useParams } from "react-router-dom";
// import { useEffect, useState } from "react";
// import ProductosJson from "../Product/Productos.json";
// import ItemDetail from "../ItemDetail/ItemDetail";
// import { getFirestore, doc, getDoc} from "firebase/firestore";

// export default function ItemDetailContainer() {
//   const [producto, setProducto] = useState(null);
//   const { productId } = useParams();

//   function buscaId(productId) {
//     return new Promise((resolve, reject) => {
//       setTimeout(() => {
//         const producto = ProductosJson.find((producto) => producto.id === productId);
//         if (producto) {
//           resolve(producto);
//         } else {
//           reject("El producto que buscas ya no está disponible");
//         }
//       }, 2000);
//     });
//   }

//   useEffect(() => {
//     buscaId(productId)
//       .then((res) => setProducto(res))
//       .catch((messageNF) => {
//         console.log(messageNF);
//       })
//   }, [productId]);


//   return (

//     <ItemDetail ProductoSeleccionado= {producto}/>

//   );

// }

import { useParams } from "react-router-dom";
import { useEffect, useState } from "react";
import ItemDetail from "../ItemDetail/ItemDetail";
import { getFirestore, doc, getDoc } from "firebase/firestore";

export default function ItemDetailContainer() {
  const [producto, setProducto] = useState(null);
  const { productId } = useParams();

  useEffect(() => {
    const db = getFirestore();
    const productoRef = doc(db, "productos", productId);

    const fetchData = async () => {
      try {
        const productoDoc = await getDoc(productoRef);

        if (productoDoc.exists()) {
          setProducto({ id: productId, ...productoDoc.data() });
        } else {
          console.log("El producto que buscas no está disponible");
        }
      } catch (error) {
        console.error("Error al obtener datos:", error);
      }
    };

    fetchData();
  }, [productId]);

  return (
    <ItemDetail ProductoSeleccionado={producto} />
  );
}
