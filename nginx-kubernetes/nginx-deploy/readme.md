# Hola, el documentaion 

sedikit dokumentasi tentang bagaimana menjalanakan yang satu ini. Stack yang dipakai adalah helm chart untuk mempersingkat waktu pengerjaan. saya menggunakan chart dokumentasi dari https://github.com/kubernetes/ingress-nginx/tree/main/charts/ingress-nginx.

prerequisite:
- helm (prefer helm3)
- kubectl terinstall dan sudah terhubung ke cluster akan sangat baik

Berikut cara implementasi yang saya sarankan
```
helm install nginx-ingress nginx-deploy --values values.yaml 
```

explanation :
```
helm install RELEASE_NAME ./path/to/local/chart --values ./path/to/custom/values.yaml
```

fin.

ttd Panji Iman Baskoro