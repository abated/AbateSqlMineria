import { useEffect, useState } from "react";
import ItemList from "../ItemList/Itemlist";
import { getFirestore, collection, getDocs} from "firebase/firestore";
import { useParams } from "react-router-dom";

export default function ItemListContainer() {
  const { category } = useParams();
  const [productos, setProductos] = useState([]);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const db = getFirestore();

    const productosCollection = collection(db, "productos");

    let queryProductos;
    if (category) {
      queryProductos = query(productosCollection, where("categoria", "==", category));
    } else {
      queryProductos = productosCollection;
    }

    
    const fetchData = async () => {
      try {
        const snapshot = await getDocs(queryProductos);
        const productosData = snapshot.docs.map(doc => ({ id: doc.id, ...doc.data() }));
        setProductos(productosData);
      } catch (error) {
        console.error("Error al obtener datos:", error);
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [category]);

  return (
    <main>
      <section className="item-list-container">
        {loading ? (
          <p>Cargando productos...</p>
        ) : (
          <ItemList products={productos} />
        )}
      </section>
    </main>
  );
}

//Con JSON
// import { useEffect, useState } from "react";
// import {  useParams } from "react-router-dom";
// import ProductosJson from "../Product/Productos.json";
// import ItemList from "../ItemList/Itemlist";
// import { getFirestore, doc, getDoc} from "firebase/firestore";


// function asyncMock(categoryId) {
//   return new Promise((resolve, reject) => {
//     setTimeout(() => {
//       if (categoryId === undefined) {
//         resolve(ProductosJson);
//       } else {
//         const productosFiltrados = ProductosJson.filter((item) => {
//           return item.categoria === categoryId;
//         });

//         if (productosFiltrados.length === 0) {
//           reject("No se encontraron resultados");
//         }

//         resolve(productosFiltrados);
//       }
//     }, 2000);
//   });
// }

// export default function ItemListContainer() {
//   const { categoryId } = useParams();
//   const [productos, setProductos] = useState([]);

//   useEffect(() => {
//     asyncMock(categoryId)
//       .then((res) => setProductos(res))
//       .catch((mensaje) => {
//         console.log(mensaje);
//       });
//   }, [categoryId]);

//   return (
//     <main>
//       <section className="item-list-container">
//         <ItemList products={productos} />
//       </section>
//     </main>
//   );
// }