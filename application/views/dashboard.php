<div class="container-fluid">

	<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="<?php echo base_url('assets/img/logo.jpg') ?>" class="d-block w-100" alt="...">
      </div>
      <div class="carousel-item">
        <img src="<?php echo base_url('assets/img/logo.jpg') ?>" class="d-block w-100" alt="...">
      </div>
      <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
    <div class="row text-center mt-3 justify-content-center">
      <?php foreach ($barang as $brg) : ?>
      <div class="card ml-3 mb-3" style="width: 16rem;">
        <img src="<?php echo base_url(). '/uploads/'.$brg->gambar ?>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title mb-1"><?php echo $brg->nama_brg ?></h5>
          
          <div class="p2"><span class="badge badge-dark mb-3">Rp. <?php echo number_format($brg->harga, 0,',','.') ?></span></div>
          <?php echo anchor('dashboard/tambah_ke_keranjang/'.$brg->id_brg,'<div class="btn btn-sm btn-danger">Tambah ke Keranjang</div>') ?>
          <?php echo anchor('dashboard/detail/'.$brg->id_brg,'<div class="btn btn-sm btn-outline-dark">Detail</div>') ?>
        </div>
      </div>
          <?php endforeach; ?>
    </div>
  </div>
  
  <div class="con1">
  </div>
</div>

  <div class="container-fluid ">
    <div class="row">
        <div class="col-6">
          <h3 class="text-dark">Ngopi Ja</h3>
          <p class="h5 text-dark">Penuhi kebuhan kopimu</p>
        </div>
        <div class="col-3">
          <p class="h5 text-dark">Tentang Kami</p>
          <a href="<?php echo base_url('dashboard/contact')?>" class="text-dark">Kontak</a>
        </div>
        <div class="col-3">
          <p class="h5 text-dark">Alamat</p>
          <p class="text-dark">Jl.Kopi no.333, Bantul, Daerah Istimewa Yogyakarta </p>
        </div>
    </div>
  </div>

  <div class="con1">
  </div>