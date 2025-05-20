package SpringBoot.ProductoSpring.repository;

import SpringBoot.ProductoSpring.entities.Producto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProductoRepository  extends JpaRepository<Producto, String>
{
}
