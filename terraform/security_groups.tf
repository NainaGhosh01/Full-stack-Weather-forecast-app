# --------------------------------------
# 1. EKS Control Plane SG
# --------------------------------------
resource "aws_security_group" "eks_control_plane_sg" {
  name        = "eks-control-plane-sg"
  description = "Security group for EKS control plane"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "eks-control-plane-sg"
  }
}

# Allow inbound from worker node SG to control plane
resource "aws_security_group_rule" "control_plane_from_nodes" {
  type                     = "ingress"
  from_port                = 443
  to_port                  = 443
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_control_plane_sg.id
  source_security_group_id = aws_security_group.eks_node_sg.id
}

# Allow all outbound traffic
resource "aws_security_group_rule" "control_plane_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  security_group_id = aws_security_group.eks_control_plane_sg.id
  cidr_blocks       = ["0.0.0.0/0"]
}

# --------------------------------------
# 2. EKS Worker Node SG
# --------------------------------------
resource "aws_security_group" "eks_node_sg" {
  name        = "eks-node-sg"
  description = "Security group for EKS worker nodes"
  vpc_id      = aws_vpc.main.id

  tags = {
    Name = "eks-node-sg"
  }
}

# Allow nodes to receive traffic from the control plane
resource "aws_security_group_rule" "nodes_from_control_plane" {
  type                     = "ingress"
  from_port                = 1025
  to_port                  = 65535
  protocol                 = "tcp"
  security_group_id        = aws_security_group.eks_node_sg.id
  source_security_group_id = aws_security_group.eks_control_plane_sg.id
}

# Allow incoming app traffic (HTTP)
resource "aws_security_group_rule" "nodes_ingress_http" {
  type              = "ingress"
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_node_sg.id
}

# Allow internal node-to-node communication (important for Kubernetes)
resource "aws_security_group_rule" "nodes_ingress_internal" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  self              = true
  security_group_id = aws_security_group.eks_node_sg.id
}

# Allow all outbound traffic from nodes
resource "aws_security_group_rule" "nodes_egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.eks_node_sg.id
}
