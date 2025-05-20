package SpringBoot.ProductoSpring.entities;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Data
@AllArgsConstructor
@NoArgsConstructor

public class Producto {
    @Id
    private String codigo;
    private String nombre;
    private String precio;
}
