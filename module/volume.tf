resource "aws_ebs_volume" "glb_ebs_vol" {
  availability_zone = var.az_zone
  size = var.vol_size
  depends_on = [aws_instance.glb_ins]
}
resource "aws_ebs_snapshot" "glb_ebs_snap" {
  volume_id = aws_ebs_volume.glb_ebs_vol.id
  depends_on = [aws_ebs_volume.glb_ebs_vol]
}
