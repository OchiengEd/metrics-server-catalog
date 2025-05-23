.PHONY: catalog
catalog:
	docker build -f Containerfile -t quay.io/eochieng/metrics-server-catalog:latest .
	docker push quay.io/eochieng/metrics-server-catalog:latest

chart-uploader:
	docker build -f Containerfile.chart-uploader -t quay.io/eochieng/uploader:latest .
	docker push quay.io/eochieng/uploader:latest

bundle-build:
	docker build -f Containerfile.bundle -t quay.io/eochieng/metrics-server-bundle:latest .
