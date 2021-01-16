<?php

class Registrasi extends CI_Controller{

	public function index()
	{
		$this->form_validation->set_rules('nama', 'Nama', 'required', [
			'required'	=> 'Nama wajib di isi!'
		]);
		$this->form_validation->set_rules('username', 'Username', 'required', [
			'required'	=> 'Username wajib di isi!'
		]);
		$this->form_validation->set_rules('email', 'Email', 'required', [
			'required'	=> 'Email wajib di isi!'
		]);
		$this->form_validation->set_rules('password_1', 'Password', 'required|matches[password_2]', [
			'required'	=> 'Password wajib di isi!',
			'matches'	=> 'Password tidak sama!' 
		]);
		$this->form_validation->set_rules('password_2', 'Password', 'required|matches[password_1]');

		if($this->form_validation->run() == FALSE) {
			$this->load->view('templates/header');
			$this->load->view('registrasi');
			$this->load->view('templates/footer');
		}else {
			$data = array(
				'id'			=> '',
				'nama'			=> $this->input->post('nama'),
				'username'		=> $this->input->post('username'),
				'password'		=> $this->input->post('password_1'),
				'role_id'		=> 2,
				'email'			=> $this->input->post('email'),
				'is_active'		=> 0
			);

			$this->db->insert('tb_user',$data);
			redirect('auth/login');
		}
		
	}
}