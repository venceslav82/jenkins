pipeline 
{
    environment
   {
    PASSWORD='Password1'
    NETWORK="app-network"
   }
    agent
    {
        label 'docker'
    }
    stages 
    {
        stage('Clone') 
        { 
            steps 
            {
                git branch: 'main', url: 'https://gitlab.com/venceslav82/hw3'
            }
        }
        stage('Build') 
        { 
            steps 
            {
                sh 'docker network inspect $NETWORK >/dev/null 2>&1 || docker network create $NETWORK'

                sh 'docker image rm img-web || true'
                sh 'docker image build -t img-web --file Dockerfile.web .'

                sh 'docker image rm img-db || true'
                sh 'docker image build -t img-db --file Dockerfile.db .'

                sh 'docker container rm -f con-web || true'
                sh 'docker container run -d --name con-web --network $NETWORK -p 8080:80 img-web' 

                sh 'docker container rm -f con-db || true'
                sh 'docker container run -d --name con-db --network $NETWORK -e MYSQL_ROOT_PASSWORD=$PASSWORD img-db' 
            }
        }
    }
}