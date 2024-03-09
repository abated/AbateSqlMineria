import Container from 'react-bootstrap/Container';
import Nav from 'react-bootstrap/Nav';
import Navbar from 'react-bootstrap/Navbar';
import CarWidget from '../CartWidget/CarWidget';
import Logo from '../../Logo';
import { getFirestore, collection, getDocs, query, where } from "firebase/firestore";
import { NavLink } from 'react-router-dom';

function NavBar() {
  return (
    <>
      <Navbar bg="dark" data-bs-theme="dark">
        <Container>
        <NavLink to="/"><Navbar.Brand ><Logo/></Navbar.Brand></NavLink>
          <Nav className="me-auto">
          <NavLink to="/categoryId/Home">Home</NavLink>
            <NavLink to="/categoryId/Guitarra">Guitarra</NavLink>
            <NavLink to="/categoryId/Amplificador" >Amplificador</NavLink>
            <NavLink to="/categoryId/Pianos">Pianos</NavLink>
            <NavLink to="/categoryId/Microfono">Microfono</NavLink>
            <NavLink to="/Cart"> <CarWidget/> </NavLink>
          </Nav>
        </Container>
      </Navbar>
      </>
  );
}

export default NavBar;