# CS-454-proj-2

# requirements 

Linux environment (mainly for part 2)
Docker
Kubectl
Terraform
k3d

# Part 1

1. In /actual build the docker image
'''bash
docker build -t my-backend:local
'''
3. go into /project and run these commands
     - terraform init
     - terraform validate
     - terraform apply

4. visit the site, you sould see some json output 
     - http://localhost:8080

# Part 2


# Reflection:

  Overall this was a fairly difficult project a lot of configs to dive into and configure to speak to one another. Terraform is fantastic, very simple on the surface but with a ton of depth to really get in there for future reference. I enjoyed setting up the containers for Part 1 and getting them to speak to each other and pass variables through secrets; it was satisfying to see the JSON message pop up in the tab with data, genuinely cool. Now for Part 2 that was hell for me. 90% of my time was spent on Part 2. I kept running into issues with WSL and the native Docker image conflicting with one another and not porting over the main image to the right one. I had to spool up a VM in Linux just to get it to work and simplify the deep magic that goes on when you type terraform apply. It was terrible, definitely won’t be using k3d if I can avoid it; it was a nightmare to deal with. While simpler than Part 1, it just had so many issues that it makes it not worth the effort to me.
