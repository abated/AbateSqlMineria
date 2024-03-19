import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import CarWidget from '../CartWidget/CarWidget';
import Logo from '../../Logo';
import { getFirestore, collection, getDocs, query, where } from "firebase/firestore";
import { NavLink } from 'react-router-dom';
import './NavBar.css'; 

function NavBar() {
  return (
    <>
      <Navbar bg="dark" data-bs-theme="dark">
        <Container className='Navbar'>
        <NavLink to="/"><Navbar.Brand ><Logo/></Navbar.Brand></NavLink>
          <Nav className="me-auto">
          <NavLink to="/">Home</NavLink>
            <NavLink to="/categoriaId/Guitarra">Guitarra</NavLink>
            <NavLink to="/categoriaId/Amplificador" >Amplificador</NavLink>
            <NavLink to="/categoriaId/Pianos">Pianos</NavLink>
            <NavLink to="/categoriaId/Microfono">Microfono</NavLink>
            <NavLink to="/Cart"> <CarWidget/> </NavLink>
          </Nav>
        </Container>
      </Navbar>
      </>
  );
}

export default NavBar;