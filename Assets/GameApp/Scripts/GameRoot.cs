using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.Events;
using System.Linq;


public class GameRoot : MonoBehaviour
{
    public static GameRoot Inst { get; private set; } = null;
    private void Awake()
    {
        if (Inst == null)
        {
            Inst = this;
            DontDestroyOnLoad(this.gameObject);
        }
    }
}
