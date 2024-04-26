1. Create Dockerfile
2. Create an Image in Docker
3. Create an ACR
4. Push the Image to ACR
5. Create an AKS cluster
6. Attach the ACR to the AKS cluster
7. Create a namespace in the AKS cluster
8. Deploy the application to the AKS cluster
9. Create a LoadBalancer for the application


# Docker

cd "/Users/robert/Visual Studio Code/Wortell-Hackathon/AKSHackathron/Templates&SimpleApp/simple-application/simple-app"
docker build -t simpleapp .

az acr build -t wortellhackaton/simple-app -r testaksclusterrobert .

## ACR

az acr login --name testaksclusterrobert

## AKS

az aks get-credentials --resource-group RVD-WE-T-RG-MGMT --name k8s-cluster
az aks update -n k8s-cluster -g RVD-WE-T-RG-MGMT --attach-acr testaksclusterrobert
kubectl apply -f "/Users/robert/Visual Studio Code/Wortell-Hackathon/AKSHackathron/Templates&SimpleApp/simple-cluster/manifests/namespace.yaml"
kubectl apply -f "/Users/robert/Visual Studio Code/Wortell-Hackathon/AKSHackathron/Templates&SimpleApp/simple-cluster/manifests/simple-app.yaml"
kubectl apply -f "/Users/robert/Visual Studio Code/Wortell-Hackathon/AKSHackathron/Templates&SimpleApp/simple-cluster/manifests/simple-lb.yaml"