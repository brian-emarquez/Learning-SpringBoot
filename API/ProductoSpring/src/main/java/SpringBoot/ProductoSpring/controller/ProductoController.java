package SpringBoot.ProductoSpring.controller;

import SpringBoot.ProductoSpring.entities.Producto;
import SpringBoot.ProductoSpring.service.ServiceProducto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ProductoController {

    @Autowired
    ServiceProducto serviceProducto;

    @GetMapping("api/productos")
    public List<Producto> MostarProductos(){

        return serviceProducto.getProductos();
    }
}
