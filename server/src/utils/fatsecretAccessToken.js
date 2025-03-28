import axios from "axios";
import qs from "qs";

async function getAccessToken(scope = "premier") {
  const FATSECRET_CLIENT_ID = process.env.FATSECRET_CLIENT_ID;
  const FATSECRET_CLIENT_SECRET = process.env.FATSECRET_CLIENT_SECRET;
  const TOKEN_URL = "https://oauth.fatsecret.com/connect/token";

  try {
    const response = await axios.post(
      TOKEN_URL,
      qs.stringify({
        grant_type: "client_credentials",
        scope: "premier"
      }),
      {
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        auth: {
          username: FATSECRET_CLIENT_ID,
          password: FATSECRET_CLIENT_SECRET,
        },
      }
    );

    const accessToken = response.data.access_token;
    return accessToken;
  } catch (error) {
    return null;
  }
}

export { getAccessToken };
