package com.empresa.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.empresa.entity.Opcion;
import com.empresa.entity.Rol;
import com.empresa.entity.Usuario;
import com.empresa.service.UsuarioServicio;



@Controller
public class LoginController {

	@Autowired
	private UsuarioServicio servicio;

	@RequestMapping("/")
	public String verLogin() { return "login"; }
	
	@RequestMapping("/home")
	public String salida() {
		return "intranetHome";
	}
	
	@RequestMapping("/homeVendedor")
	public String salida2() {
		return "homeVendedor";
	}
	
	@RequestMapping("/homeCliente")
	public String salida3() {
		return "homeCliente";
	}
	

	
	@RequestMapping("/verIntranetHome")
	public String verHome() { return "intranetHome"; }

	
	@RequestMapping("/crudProducto")
	public String crudProducto() { return "crudProducto"; }
	
	@RequestMapping("/crudUsuario")
	public String crudUsuario() { return "crudUsuario"; }
	
	
	@RequestMapping("/login")
	public String login(Usuario usu, HttpSession  session, HttpServletRequest request) {
		
		Usuario objUsu = servicio.login(usu);
		if(objUsu == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		}
		else if(objUsu.getTipoUsuario().getIdTipoUsuario()==1) {
			List<Rol> roles = servicio.traerRolesDeUsuario(objUsu.getIdUsuario());
			List<Opcion> menus = servicio.traerEnlacesDeUsuario(objUsu.getIdUsuario());
			
		
				session.setAttribute("objUsuario", objUsu);
				session.setAttribute("objRoles", roles);
				session.setAttribute("objMenus", menus);
				return "redirect:home";
		}else if(objUsu.getTipoUsuario().getIdTipoUsuario()==2) {
			
			session.setAttribute("objUsuario", objUsu);
			return "redirect:homeVendedor"; 
		}
	     else {
	    	 session.setAttribute("objUsuario", objUsu);
	   
		     return "redirect:homeCliente"; 
		
         }
		
		
	}
	

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		
		//Destruir todos los objetos de la sesion mediante programación
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}
	
}
