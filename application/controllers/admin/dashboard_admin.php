<?php

class Dashboard_admin extends CI_Controller{

	public function __construct(){
		parent::__construct();

		if($this->session->userdata('role_id') != '1'){
			$this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
					  Anda Belum Login! Silahkan Login!
					</div>');
			redirect('auth/login');
		}
	}
	public function index()
	{
		$data['total_brg'] = $this->model_barang->jumlah_barang();
		$data['total_inv'] = $this->model_barang->jumlah_invoice();
		$this->load->view('templates_admin/header');
		$this->load->view('templates_admin/sidebar');
		$this->load->view('admin/dashboard', $data);
		$this->load->view('templates_admin/footer');
	}
}