terraform {
  encryption {
    key_provider "pbkdf2" "state_key" {
      passphrase = var.passphrase
    }

    method "aes_gcm" "encryption_method" {
      keys = key_provider.pbkdf2.state_key
    }

    state {
      method = method.aes_gcm.encryption_method

      enforced = true
    }

    plan {
      method = method.aes_gcm.encryption_method

      enforced = true
    }
  }
}
