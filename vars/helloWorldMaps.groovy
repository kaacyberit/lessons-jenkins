def call(Map config = [:]) {
    sh "echo Hello ${config.name}. You are ${config.age} years old!"
}