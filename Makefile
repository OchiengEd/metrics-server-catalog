catalog:
	docker build -f Containerfile -t quay.io/eochieng/metrics-server-catalog:latest .

publish:
	docker push quay.io/eochieng/metrics-server-catalog:latest
