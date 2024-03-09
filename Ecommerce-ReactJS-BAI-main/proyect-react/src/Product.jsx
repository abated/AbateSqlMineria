export const Product = ({img, title, description, precio}) => {
  return(
    <>
      <img src={img} alt="producto 1" />
      <h1>{title}</h1>
      <p>{description}</p>
      <p>$ {precio}</p>
    </>
  )
}
