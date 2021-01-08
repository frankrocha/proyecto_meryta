package com.empresa.service;

import java.util.List;

import com.empresa.entity.Opcion;



public interface OpcionService {
	public abstract List<Opcion> listaTodos();
	public abstract List<Opcion> listaTodosRol(int idRol);
}
