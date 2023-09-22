# Attendre que Jenkins soit prêt
while ! curl -sSf http://localhost:8080 -o /dev/null; do
    echo "Jenkins n'est pas encore accessible. Attente de 10 secondes..."
    sleep 10
done

# Déclencher le pipeline Jenkins
JENKINS_URL="http://localhost:8080"  # Mettez à jour l'URL Jenkins si nécessaire
JOB_NAME="Test"  # Mettez à jour avec le nom de votre job Jenkins
AUTH= echo -n "Herve:Test123" | base64  # Remplacez <USERNAME> par votre nom d'utilisateur Jenkins et <API_TOKEN> par votre jeton d'API Jenkins

CRUMB=$(curl -s "$JENKINS_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)" -u "$AUTH")
curl -X POST "$JENKINS_URL/job/$JOB_NAME/build" -u "$AUTH" -H "$CRUMB"