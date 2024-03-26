import './App.css';
import NavBar from './Components/NavBar/NavBar';
import React from 'react';
import ItemDetailContainer from './Components/ItemDetailContainer/ItemDetailContainer';
import ItemListContainer from './Components/ItemListContainer/ItemListContainer';
import { BrowserRouter, Routes, Route } from 'react-router-dom';
import Cart from './Components/carts/Cart';
import { ShoppingCartProvider } from './Components/CartContext/CartContext';

function App() {
  return (
    <ShoppingCartProvider>

    <BrowserRouter> 
    <NavBar />
    <Routes>
      <Route path="/" element={<ItemListContainer />} />
        <Route path="/category/:category" element={<ItemListContainer />} />
        <Route path="/product/:productId" element={<ItemDetailContainer />} />
        <Route path="/cart" element={<Cart/>} />
      </Routes>
    </BrowserRouter>
    </ShoppingCartProvider>
  );
}

export default App;


