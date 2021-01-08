package com.empresa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.empresa.entity.Rol;
import com.empresa.repository.RolRepository;



@Service
public class RolServiceImpl implements RolService{
	@Autowired
	private RolRepository repository;
	
	@Override
	public List<Rol> listarTodos() {
		return repository.findAll();
	}

}
