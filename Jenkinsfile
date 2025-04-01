pipeline{
    agent any
        stages{
            stage("SCM checkout"){
                steps{
                    git url:'https://github.com/abhijadhav2618/django-todo.git', branch:'develop'
                }
            }

            stage("docker build"){
                steps{
                    sh "docker build -t abhijadhav2618/django-to-do ."
                }
            }

            stage("Push image to docker hub"){
                steps{
                    withDockerRegistry(credentialsId: 'Docker_Hub_Cred', url:"https://index.docker.io/v1/") {
                        sh "docker push abhijadhav2618/django-to-do:latest"

                    }   
                }
            }
        
    }
}
