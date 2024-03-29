<?php if ($_settings->chk_flashdata('success')) : ?>
	<script>
		alert_toast("<?php echo $_settings->flashdata('success') ?>", 'success')
	</script>
<?php endif; ?>
<div class="card card-outline card-primary">
	<div class="card-header">
		<h3 class="card-title">List of Products</h3>
		<div class="card-tools">
			<a href="?page=product/manage_product" class="btn btn-flat btn-primary"><span class="fas fa-plus"></span> Create New</a>
		</div>
	</div>
	<div class="card-body">
		<div class="container-fluid">
			<div class="container-fluid">
				<table class="table table-bordered table-stripped">
					<colgroup>
						<col width="5%">
						<col width="15%">
						<col width="25%">
						<col width="30%">
						<col width="10%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>#</th>
							<th>Date Created</th>
							<th>Product Name</th>
							<th>Brand</th>
							<th>Status</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<?php
						$i = 1;
						$qry = $conn->query("SELECT * from `products` order by unix_timestamp(date_created) desc ");
						while ($row = $qry->fetch_assoc()) :
							foreach ($row as $k => $v) {
								$row[$k] = trim(stripslashes($v));
							}
							$row['description'] = strip_tags(stripslashes(html_entity_decode($row['description'])));
						?>
							<tr>
								<td class="text-center"><?php echo $i++; ?></td>
								<td><?php echo date("Y-m-d H:i", strtotime($row['date_created'])) ?></td>
								<td><?php echo $row['title'] ?></td>
								<td>
									<p class="m-0"><?php echo $row['brand'] ?></p>
								</td>
								<td class="text-center">
									<?php if ($row['status'] == 1) : ?>
										<span class="badge badge-success">Active</span>
									<?php else : ?>
										<span class="badge badge-danger">Inactive</span>
									<?php endif; ?>
								</td>
								<td align="center">
									
									<div class="d-flex align-items-center justify-content-center">
  									<a href="?page=product/manage_product&id=<?php echo $row['id'] ?>" class="btn btn-sm btn-primary mr-2" title="Edit Item">
   									 <span class="fa fa-edit"></span>
  											</a>
  											<a href="javascript:void(0)" data-id="<?php echo $row['id'] ?>" class="btn btn-sm btn-danger delete_data" title="Delete Item">
   											 <span class="fa fa-trash"></span>
 									 </a>
												</div>
								</td>
							</tr>
						<?php endwhile; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<script>
	$(document).ready(function() {
		$('.delete_data').click(function() {
			_conf("Are you sure to delete this product permanently?", "delete_product", [$(this).attr('data-id')])
		})
		$('.table').dataTable();
	})

	function delete_product($id) {
		start_loader();
		$.ajax({
			url: _base_url_ + "classes/Master.php?f=delete_product",
			method: "POST",
			data: {
				id: $id
			},
			dataType: "json",
			error: err => {
				console.log(err)
				alert_toast("An error occured.", 'error');
				end_loader();
			},
			success: function(resp) {
				if (typeof resp == 'object' && resp.status == 'success') {
					location.reload();
				} else {
					alert_toast("An error occured.", 'error');
					end_loader();
				}
			}
		})
	}
</script>