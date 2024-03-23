import ngrok

listener = ngrok.forward("http://localhost:11434", authtoken_from_env=False, authtoken='2dX3AiyaMZ9bc5JFBUPre9SRd0L_kKit9xXv5s7hf7E8k8Ei')

print(f"Ingress established at {listener.url()}")
