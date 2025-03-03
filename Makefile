catalog:
	docker build -f Containerfile -t quay.io/eochieng/metrics-server-catalog:latest .

publish:
	docker push quay.io/eochieng/metrics-server-catalog:latest

registry:
	docker run -d -p 5000:5000 --restart always --name registry docker.io/library/registry:2
