using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LogoScene : MonoBehaviour
{

    public string sceName;
    private void Awake()
    {
        UnityEngine.SceneManagement.SceneManager.LoadScene(sceName);
    }
}
