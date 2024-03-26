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
            <NavLink to="/category/Guitarra">Guitarra</NavLink>
            <NavLink to="/category/Amplificador" >Amplificador</NavLink>
            <NavLink to="/category/Pianos">Pianos</NavLink>
            <NavLink to="/category/Microfono">Microfono</NavLink>
            <NavLink to="/Cart"> <CarWidget/> </NavLink>
          </Nav>
        </Container>
      </Navbar>
      </>
  );
}

export default NavBar;