// Prevent Cross Site Request Forgery exploits.
import hudson.security.csrf.DefaultCrumbIssuer
import jenkins.model.Jenkins
 
def instance = Jenkins.instance
instance.setCrumbIssuer(new DefaultCrumbIssuer(true))
instance.save()