/**
 * ENV-OWNED file: sizing/tuning/placement and Azure-specific identifiers.
 *
 * Runnable demo note:
 * - Provide real subnet/image/resource group values in your subscription.
 * - Provide an SSH public key path on your machine (do not commit keys to Git).
 */

compute = {
  size    = "Standard_B1s"
  disk_gb = 30

  placement = {
    subnet_ref = "/subscriptions/<SUB>/resourceGroups/<RG-NET>/providers/Microsoft.Network/virtualNetworks/<VNET>/subnets/<SUBNET>"
  }

  azure = {
    source_image_id     = "/subscriptions/<SUB>/resourceGroups/<RG-IMAGES>/providers/Microsoft.Compute/images/<IMAGE>"
    resource_group_name = "<RG-COMPUTE>"
    location            = "eastus"

    # Runnable: path to a public key on your workstation.
    # Example paths:
    # - mac/linux: "~/.ssh/id_ed25519.pub"
    # - windows:   "C:\\Users\\<you>\\.ssh\\id_ed25519.pub"
    ssh_public_key_path = "~/.ssh/id_ed25519.pub"

    system_assigned_identity = true
  }
}
