pipeline {
agent any
parameters {
    string(name: 'NUM1', defaultValue: '1', description: null)
    string(name: 'NUM2', defaultValue: '3', description: null)
}
    stages {
        stage('f5') {
            steps ('params manipulation'){
                // echo "Jenkins params manipulation"
                // echo "two methods to get params var"
                echo "NUM1 = ${params.NUM1}"
                echo "NUM2 = ${params.NUM2}"
                echo "NUM1 = $NUM1"
                echo "NUM2 = $NUM2"
                
                // echo "But when we want to make opposite action"
                // echo "next 2 rows wont work"
                // echo "params.NUM1=14"
                // echo "params.NUM1=24"
                
                // echo "and next 2 rows will define a new Jenkins variable."
                // echo "and this action throw a warning in console that we you had forget define variables with "def" keyword"
                // echo "variable is useful and its manipulation is possible inside [script {...}] block"
                script { NUM1=14 } //write it like this
                script { NUM2 = 24 } // or like this
                
                // echo "check if params was changed"
                echo "NUM1 = ${params.NUM1}"
                echo "NUM2 = ${params.NUM2}"
                // echo "next 2 rows represent not params value, but Jenkins variables value"
                echo "NUM1 = $NUM1"
                echo "NUM2 = $NUM2"
                
                
                
                // echo "shell script params manipulation"
                // echo "multiline shell script"
                sh '''
                    echo "Hello from stage 1!"
                    #######################
                    echo "Is it possible to GET params value from shell script? - YES!"
                    echo "from script we get results of PARAMETERS value and NOT vars value"
                    echo "NUM1 = $NUM1"
                    echo "NUM2 = $NUM2"
                    echo "Is it possible to SET params value from shell script? - YES! But scope is limited by script"
                    NUM1=27
                    NUM2=37
                    echo "NUM1 = $NUM1"
                    echo "NUM2 = $NUM2"
                    ########################
                    echo "how can we pass script results from one stage to another?"
                    echo "with help of files"
                    n1=$(shuf -i 1-20 -n 1)
                    n2=$(shuf -i 1-20 -n 1)
                    echo "$n1" > scriptvars_n1
                    echo "$n2" > scriptvars_n2
                '''
                // echo "one line shell script"
                sh 'pwd; ls -la;'
                
                // echo "check if params was changed"
                echo "NUM1 = ${params.NUM1}"
                echo "NUM2 = ${params.NUM2}"
                // echo "next 2 rows represent not params value, but Jenkins variables value"
                echo "NUM1 = $NUM1"
                echo "NUM2 = $NUM2"
            }
        }
        stage('f6') {
            steps {
                // echo "Jenkins params manipulation"
                // echo "params and Jenkins variable accessible between stages"
                // echo "check if params was changed - NO params value is the same"
                echo "NUM1 = ${params.NUM1}"
                echo "NUM2 = ${params.NUM2}"
                // echo "next 2 rows represent not params value, but Jenkins variables value"
                echo "NUM1 = $NUM1"
                echo "NUM2 = $NUM2"

                
                // echo "shell script params manipulation"
                // echo "multiline shell script"
                sh '''
                    #!/bin/bash
                    echo "Hello from stage 2!"
                    ########################
                    echo "Is it still possible to GET params value from shell script? - YES!"
                    echo "from script we still get results of PARAMETERS value and NOT vars value"
                    echo "NUM1 = $NUM1"
                    echo "NUM2 = $NUM2"
                    ########################
                    echo "end we can get access to results of previous stage"
                    num1=`cat scriptvars_n1` 
                    num2=`cat scriptvars_n2`
                    RESULT=$((num1 + num2))
                    echo "$num1 + $num2 = $RESULT" 
                '''
                // echo "one line shell script"
                sh 'pwd; ls -la;'
            }
        }
    }
}