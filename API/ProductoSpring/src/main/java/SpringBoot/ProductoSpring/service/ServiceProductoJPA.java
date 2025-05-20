package SpringBoot.ProductoSpring.service;

import SpringBoot.ProductoSpring.entities.Producto;
import SpringBoot.ProductoSpring.repository.ProductoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ServiceProductoJPA implements ServiceProducto {

    @Autowired
    ProductoRepository productoRepository;

    public List<Producto> getProductos() {
        return productoRepository.findAll(); //trae lo datos de la tabla
    }
}
