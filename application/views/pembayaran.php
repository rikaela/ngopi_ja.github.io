<div class="container-fluid">
	<div class="row">
		<div class="col-md-2"></div>
		<div class="col-md-8">
			<div class="btn btn-sm btn-success">
				<?php  
				$grand_total = 0;
				if ($keranjang = $this->cart->contents())
				{
					foreach ($keranjang as $item)
					{
						$grand_total = $grand_total + $item['subtotal'];
					}
					echo "<h5>Total Belanja Anda: Rp. ".number_format($grand_total,0,',','.');
					?>
			<!-- form input pembayaran/pengiriman -->
			</div><br><br>
			<h3>Input Alamat Pengiriman  dan Pembayaran</h3>
			<form method="post" action="<?php echo base_url() ?>dashboard/proses_pesanan">
				<div class="form-group">
					<label>Nama Lengkap</label>
					<input type="text" name="nama" placeholder="Nama Lengakp Anda" class="form-control">
				</div>

				<div class="form-group">
					<label>Alamat Lengkap</label>
					<input type="text" name="alamat" placeholder="Alamat Lengakp Anda" class="form-control">
				</div>

				<div class="form-group">
					<label>No. Telepon</label>
					<input type="text" name="no_telp" placeholder="Nomer Telepon Anda" class="form-control">
				</div>

				<div class="form-group">
					<label>Penggiriman</label>
					<select class="form-control">
						<option>JNE</option>
						<option>POS</option>
						<option>J&T</option>
						<option>TIKI</option>
						<option>GOJEK</option>
						<option>GRAB</option>
					</select>
				</div>

				<div class="form-group">
					<label>Pembayaran</label>
					<select class="form-control">
						<option>BCA - XXXXX</option>
						<option>BNI - XXXXX</option>
						<option>BRI - XXXXX</option>
						<option>MANDIRI - XXXXX</option>
						<option>DANA</option>
						<option>OVO</option>
						<option>Indomaret</option>
						<option>Alfamart</option>
					</select>
				</div>
				<button type="submit" class="btn btn-sm btn-primary mb-3">Pesan</button>
			</form>
			<?php  
			}else{
				echo "<h5>Keranjang Belanja Anda Masih Kosong!"; 
			}
			?>
		</div> 
		<div class="col-md-2"></div>
	</div>
</div>

<div class="con1">
</div>