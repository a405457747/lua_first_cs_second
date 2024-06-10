using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class API : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        List<int> a = new List<int>() { 3, 2, 1 };

        a.AddRange(new List<int>() { 2, 3 });
        Debug.Log(a);
    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
