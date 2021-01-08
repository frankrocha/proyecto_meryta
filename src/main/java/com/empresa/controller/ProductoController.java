package com.empresa.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.Producto;
import com.empresa.entity.TipoProducto;
import com.empresa.service.ProductoService;
import com.empresa.service.TipoProductoService;

@Controller
public class ProductoController {

	@Autowired
	private ProductoService productoService;
	@Autowired
	private TipoProductoService  tipoProductoService;

	
	@RequestMapping("/verProducto")
	public String ver() {
		return "intranetRegistraLibro";
	}

	// combo
	@RequestMapping("/cargaTipoProducto")
	@ResponseBody
	public List<TipoProducto> listaTipoProducto() {
		return tipoProductoService.listaTipoProducto();
	}
	
	@RequestMapping("/cargaProductos")
	@ResponseBody
	public List<Producto> listaProductos() {
		return productoService.listaTodos();
	}

	
	
	@RequestMapping("/consultaCrudProducto")
	public String lista(String filtro, HttpSession session) {
		List<Producto> lista = productoService.listarPorDescripcion(filtro+"%");
		session.setAttribute("productos", lista);
		return "crudProducto";
	}
	
	

	@RequestMapping("/insertaActualizaCrudProducto")
	public String registrarProducto(Producto obj, HttpSession session) {
		
		try {
			Producto objSalida = productoService.insertaActualizaProducto(obj);
			if (objSalida != null) {
				session.setAttribute("MENSAJE", "Se registró correctamente");
			} else {
				session.setAttribute("MENSAJE", "Error al registrar o Actualizar ");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaProducto";
	}

	@RequestMapping("/eliminaCrudProducto")
	public String elimina(int id, HttpSession session) {

		try {
			Optional<Producto> obj = productoService.buscarPorId(id);
			if (obj.isPresent()) {
				productoService.eliminarProducto(id);
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			} else {
				session.setAttribute("MENSAJE", "No existe el ID");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaProducto";
	}

	@RequestMapping("/salidaProducto")
	public String listarTodos(HttpSession session) {
		List<Producto> data = productoService.listaTodos();
		session.setAttribute("productos", data);
		return "crudProducto";
	}
	
	
	@RequestMapping("/consultaProductoXTipo")
	@ResponseBody
	public List<Producto> consuta(int parametro) {
		if (parametro == 0) {
			return new ArrayList<Producto>();
		}else if (parametro == -1){
			return productoService.listaTodos();
		}else {
			return productoService.listarPorTipo(parametro);
		}
	}
	

	
	
	
}
