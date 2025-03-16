plugins {
    id("com.android.library")
    id("kotlin-android")
}

android {
    compileSdk = 33  // Make sure this is your compileSdk version

    namespace = "com.larpon.on_audio_query_android"  // ADD THIS LINE

    defaultConfig {
        minSdk = 21
        targetSdk = 33
    }
}



allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}

//tasks.register<Delete>("clean") {
//  delete(rootProject.layout.buildDirectory)
//}
