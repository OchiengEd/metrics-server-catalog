catalog:
	docker build -f Containerfile -t quay.io/eochieng/metrics-server-catalog:devel .

publish-catalog:
	docker push quay.io/eochieng/metrics-server-catalog:devel
