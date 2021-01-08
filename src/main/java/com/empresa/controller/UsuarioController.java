package com.empresa.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.empresa.entity.TipoUsuario;
import com.empresa.entity.Usuario;
import com.empresa.service.TipoUsuarioService;
import com.empresa.service.UsuarioServicio;



@Controller
public class UsuarioController {

	@Autowired
	private UsuarioServicio usuarioServicio;

	@Autowired
	private TipoUsuarioService tipoUsuarioService;

	@RequestMapping("/verCrudUsuario")
	public String ver() {
		return "crudUsuario";
	}


	@RequestMapping("/consultaCrudUsuario")
	public String lista(String filtro, HttpSession session) {
		List<Usuario> lista = usuarioServicio.listaPorNombre(filtro+"%");
		session.setAttribute("usuarios", lista);
		return "crudUsuario";
	}


	@RequestMapping("/cargaTipoUsuario")
	@ResponseBody
	public List<TipoUsuario> listaTipoUsuarios() {
		return tipoUsuarioService.listarUsuario();
	}

	@RequestMapping("/insertaActualizaCrudUsuario")
	public String regtistraUsuario(Usuario obj, HttpSession session) {
		try {
			Usuario objSalida = usuarioServicio.insertaUsuario(obj);
			if (objSalida != null) {
				session.setAttribute("MENSAJE", "Registro exitoso");
			} else {
				session.setAttribute("MENSAJE", "Registro fallido");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Registro fallido");
		}

		return "redirect:salida";
	}

	@RequestMapping("/eliminaCrudUsuario")
	public String elimina(String id, HttpSession session) {
		try {
			Optional<Usuario> obj = usuarioServicio.buscarUsuarioPorId(Integer.parseInt(id));
			if (obj.isPresent()) {
				usuarioServicio.eliminaUsuarioPorId(Integer.parseInt(id));
				session.setAttribute("MENSAJE", "Se eliminó correctamente");
			} else {
				session.setAttribute("MENSAJE", "El ID enviado no existe");
			}
		} catch (Exception e) {
			e.printStackTrace();
			session.setAttribute("MENSAJE", "Error al eliminar");
		}
		return "redirect:salida";
	}

	@RequestMapping("/salida")
	public String salida(HttpSession session) {
		
		List<Usuario> data = usuarioServicio.listaUsuarios();
		session.setAttribute("usuarios", data);
		
		return "crudUsuario";
	}

}
