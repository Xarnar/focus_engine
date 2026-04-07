allprojects {
    repositories {
        google()
        mavenCentral()
    }
}

val newBuildDir: Directory =
    rootProject.layout.buildDirectory
        .dir("../../build")
        .get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)
}
subprojects {
    project.evaluationDependsOn(":app")
}
subprojects {
    // Escuchamos cuando se añade un plugin de Android a cualquier subproyecto (librería)
    plugins.whenPluginAdded {
        if (this is com.android.build.gradle.api.AndroidBasePlugin) {
            // Accedemos a la extensión de android de forma segura
            val android = project.extensions.findByType(com.android.build.gradle.BaseExtension::class.java)
            android?.let {
                if (it.namespace == null) {
                    // Si la librería es vieja y no tiene namespace, le ponemos el nombre de su grupo
                    it.namespace = project.group.toString()
                }
            }
        }
    }
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}
