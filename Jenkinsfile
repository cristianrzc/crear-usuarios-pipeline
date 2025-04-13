pipeline {
    agent any

    parameters {
        string(name: 'LOGIN', description: 'Login del usuario (ej: jdoe)')
        string(name: 'NOMBRE_COMPLETO', description: 'Nombre y apellido del usuario')
        choice(name: 'DEPARTAMENTO', choices: ['contabilidad', 'finanzas', 'tecnologia'], description: 'Departamento o grupo del usuario')
    }

    stages {
        stage('Clonar repositorio') {
            steps {
                git 'https://github.com/cristianrzc/crear-usuarios-pipeline.git'
            }
        }

        stage('Crear usuario') {
            steps {
                sh 'bash crear_usuario.sh "$LOGIN" "$NOMBRE_COMPLETO" "$DEPARTAMENTO"'
            }
        }
    }

    post {
        success {
            echo "✅ Usuario $LOGIN creado correctamente."
        }
        failure {
            echo "❌ Hubo un error al crear el usuario."
        }
    }
}
